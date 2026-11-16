// Reimplementation of `unit` from metro 0.3.0 (a siunitx port), which no
// longer compiles on current Typst. Follows metro's manual, section 2.3 & 4.
//
//   #unit("kilo gram metre per square second")   kg m s⁻²
//   #unit("kg m / s^2")                          kg m s⁻²
//   $unit(kilo gram metre / second^2)$           (after `#import units: *, prefixes: *`)
//
// Extension over metro: a trailing number is a power, so no `^` is needed:
//   #unit("kg m2 s-2")  ==  #unit("kg m^2 s^-2")

#import "unit-defs.typ" as units
#import "prefix-defs.typ" as prefixes
#import "prefix-defs.typ": _p as create-prefix

#let _public(mod) = {
  let d = dictionary(mod)
  for k in d.keys() { if k.starts-with("_") { let _ = d.remove(k) } }
  d
}

#let _default-options = (
  inter-unit-product: sym.space.thin,
  per-mode: "power", // "power" | "fraction" | "symbol"
  per-symbol: sym.slash,
  bracket-unit-denominator: true,
  sticky-per: false,
  qualifier-mode: "subscript", // "subscript" | "bracket" | "combine" | "phrase"
  qualifier-phrase: "",
  power-half-as-sqrt: false,
)

#let _builtin-powers = (
  square: (before: true, power: 2),
  cubic: (before: true, power: 3),
  squared: (before: false, power: 2),
  cubed: (before: false, power: 3),
)

#let _state = state("mod-units", (
  options: _default-options,
  units: (:),
  prefixes: (:),
  powers: (:),
  qualifiers: (:),
))

#let _check-options(opts) = {
  for k in opts.keys() {
    assert(k in _default-options, message: "unit: unknown option `" + k + "`")
  }
}

// ---------------------------------------------------------------- setup

#let unit-setup(..options) = {
  _check-options(options.named())
  _state.update(s => { s.options += options.named(); s })
}
#let unit-reset() = _state.update(s => { s.options = _default-options; s })

#let declare-unit(name, symbol) = _state.update(s => { s.units.insert(name, symbol); s })
#let declare-prefix(name, symbol, power-tens) = _state.update(s => {
  s.prefixes.insert(name, symbol)
  s
})
#let declare-power(before, after, power) = _state.update(s => {
  s.powers.insert(before, (before: true, power: power))
  s.powers.insert(after, (before: false, power: power))
  s
})
#let declare-qualifier(name, symbol) = _state.update(s => { s.qualifiers.insert(name, symbol); s })

// ---------------------------------------------------------------- helpers

#let _num(x) = {
  let x = if type(x) == str { x } else { x.text }
  float(x.trim().replace("−", "-").trim("(").trim(")"))
}

#let _to-str(it) = {
  if it == none { return "" }
  if type(it) in (str, int, float) { return str(it) }
  if it.has("text") { return it.text }
  if it.has("children") { return it.children.map(_to-str).join() }
  if it.has("body") { return _to-str(it.body) }
  ""
}

#let _prefix-symbol(p) = if type(p) == content and p.func() == math.class { p.body } else { p }

// A term: (prefix: content|none, symbol: content, power: float, qualifier: content|none)
#let _term(symbol, prefix: none, power: 1) = (
  prefix: prefix, symbol: symbol, power: power, qualifier: none,
)

// ---------------------------------------------------------------- string input

#let _token-re = regex(
  "(tothe|raiseto|of|sqrt)\(([^)]*)\)"     // 1,2  function forms
  + "|\^\(([^)]*)\)"                       // 3    ^(4.5)
  + "|\^([-−+]?[0-9.]+)"                   // 4    ^2, ^-1
  + "|_\(([^)]*)\)"                        // 5    _(cat)
  + "|_([^\s/^_()]+)"                      // 6    _metal
  + "|(/)"                                 // 7
  + "|([^\s/^_()]+)"                       // 8    word
)

#let _parse-string(input, s) = {
  let all-units = _public(units) + s.units
  let all-prefixes = _public(prefixes) + s.prefixes
  let powers = _builtin-powers + s.powers

  let terms = ()
  let pending = (prefix: none, power: 1, per: false)
  let sticky = false

  let push-unit(terms, pending, sticky, symbol) = {
    let sign = if pending.per or sticky { -1 } else { 1 }
    terms.push(_term(symbol, prefix: pending.prefix, power: sign * pending.power))
    terms
  }
  let fresh = (prefix: none, power: 1, per: false)

  for m in input.matches(_token-re) {
    let c = m.captures
    if c.at(0) != none {
      let (f, arg) = (c.at(0), c.at(1))
      if f == "tothe" {
        terms.last().power *= _num(arg)
      } else if f == "raiseto" {
        pending.power *= _num(arg)
      } else if f == "of" {
        terms.last().qualifier = arg
      } else if f == "sqrt" {
        let inner = _parse-string(arg, s)
        let first = inner.first()
        if pending.prefix != none { first.prefix = pending.prefix }
        let sign = if pending.per or sticky { -1 } else { 1 }
        terms += inner.map(t => { t.power *= 0.5 * sign * pending.power; t })
        pending = fresh
      }
    } else if c.at(2) != none {
      terms.last().power *= _num(c.at(2))
    } else if c.at(3) != none {
      terms.last().power *= _num(c.at(3))
    } else if c.at(4) != none or c.at(5) != none {
      terms.last().qualifier = if c.at(4) != none { c.at(4) } else { c.at(5) }
    } else if c.at(6) != none {
      pending.per = true
      if s.options.sticky-per { sticky = true }
    } else {
      let w = c.at(7)
      if w == "per" {
        pending.per = true
        if s.options.sticky-per { sticky = true }
      } else if w in powers {
        let p = powers.at(w)
        if p.before { pending.power *= p.power } else { terms.last().power *= p.power }
      } else if w in s.qualifiers {
        terms.last().qualifier = s.qualifiers.at(w)
      } else if w in all-prefixes {
        let p = _prefix-symbol(all-prefixes.at(w))
        pending.prefix = if pending.prefix == none { p } else { pending.prefix + p }
      } else if w in all-units {
        terms = push-unit(terms, pending, sticky, all-units.at(w))
        pending = fresh
      } else {
        // Extension: trailing number is a power ("s-2", "m2"). Otherwise a literal symbol.
        let m = w.match(regex("^(.*?[^-−0-9.])([-−]?[0-9]+(?:\.[0-9]+)?)$"))
        let (base, pow) = if m == none { (w, 1) } else { (m.captures.at(0), _num(m.captures.at(1))) }
        terms = push-unit(terms, pending, sticky, all-units.at(base, default: base))
        terms.last().power *= pow
        pending = fresh
      }
    }
  }
  terms
}

// ---------------------------------------------------------------- math input

#let _seq = ([a] + [b]).func()

#let _parse-content(it, s) = {
  if it == none { return () }
  if type(it) == str { return (_term(it),) }
  let f = it.func()
  if f != math.class and f != math.lr and it.has("body") {
    return _parse-content(it.body, s)
  }
  if f == text { return if it.text.trim() == "" { () } else { (_term(it.text),) } }
  if f in ([ ].func(), h) { return () }
  if f == math.class {
    // A lone prefix is treated as a unit (e.g. `$unit(milli)$`).
    return (_term(it.body),)
  }
  if f == math.attach {
    let inner = _parse-content(it.base, s)
    if inner.len() == 0 { return inner }
    let t = inner.pop()
    if it.has("t") and it.t != none { t.power *= _num(_to-str(it.t)) }
    if it.has("b") and it.b != none { t.qualifier = it.b }
    return inner + (t,)
  }
  if f == math.frac {
    let num = _parse-content(it.num, s)
    let den = _parse-content(it.denom, s).map(t => { t.power *= -1; t })
    return num + den
  }
  if f == math.lr {
    let ch = if it.body.func() == _seq { it.body.children } else { (it.body,) }
    if ch.len() >= 2 { ch = ch.slice(1, -1) }
    return _parse-content(ch.join(), s)
  }
  if f == math.root {
    return _parse-content(it.radicand, s).map(t => { t.power *= 0.5; t })
  }
  if f == _seq {
    let terms = ()
    let prefix = none
    let children = it.children
    for (i, ch) in children.enumerate() {
      let is-prefix = ch.func() == math.class and ch.class == "unary"
      // Prefix only if a unit follows it.
      let rest = children.slice(i + 1).filter(c => c.func() not in ([ ].func(), h))
      if is-prefix and rest.len() > 0 {
        prefix = if prefix == none { ch.body } else { prefix + ch.body }
        continue
      }
      let new = _parse-content(ch, s)
      if new.len() > 0 and prefix != none {
        new.first().prefix = prefix
        prefix = none
      }
      terms += new
    }
    return terms
  }
  (_term(it),)
}

// ---------------------------------------------------------------- display

#let _fmt-power(p) = {
  let p = if calc.fract(p) == 0 { int(p) } else { p }
  str(p).replace("-", "−")
}

#let _display-term(t, o) = {
  let out = if t.prefix == none { [#t.symbol] } else { [#t.prefix#t.symbol] }
  let p = t.power
  if o.power-half-as-sqrt and calc.abs(calc.fract(p)) == 0.5 {
    p = if p > 0 { p - 0.5 } else { p + 0.5 }
    out = math.sqrt(out)
  }
  let q = t.qualifier
  let sup = if p != 1 and p != 0 { _fmt-power(p) }
  if q == none {
    return if sup == none { out } else { math.attach(out, t: sup) }
  }
  let mode = o.qualifier-mode
  if mode == "subscript" {
    math.attach(out, t: sup, b: [#q])
  } else if mode == "bracket" {
    math.attach([#out\(#q\)], t: sup)
  } else if mode == "phrase" {
    math.attach([#out#o.qualifier-phrase#q], t: sup)
  } else if mode == "combine" {
    if sup == none { [#out#q] } else { [#math.attach(out, t: sup)\(#q\)] }
  } else {
    panic("unit: unknown qualifier-mode `" + mode + "`")
  }
}

#let _display(terms, o) = {
  let join(ts) = ts.map(t => _display-term(t, o)).join(o.inter-unit-product)
  let flip(t) = { t.power *= -1; t }
  if o.per-mode == "power" { return join(terms) }

  let num = terms.filter(t => t.power >= 0)
  let den = terms.filter(t => t.power < 0).map(flip)
  if den.len() == 0 { return join(num) }

  if o.per-mode == "fraction" {
    math.frac(if num.len() == 0 { [1] } else { join(num) }, join(den))
  } else if o.per-mode == "symbol" {
    let d = join(den)
    if o.bracket-unit-denominator and den.len() > 1 { d = [\(#d\)] }
    [#if num.len() > 0 { join(num) }#o.per-symbol#d]
  } else {
    panic("unit: unknown per-mode `" + o.per-mode + "`")
  }
}

// ---------------------------------------------------------------- public

// Typesets a unit from a string or math content. Options as in metro
// (see `_default-options`); they can also be set globally with `unit-setup`.
#let unit(input, ..options) = {
  assert(
    type(input) in (str, content),
    message: "unit: expected string or content, got " + str(type(input)),
  )
  assert(options.pos().len() == 0, message: "unit: takes a single positional argument")
  _check-options(options.named())
  context {
    let s = _state.get()
    s.options += options.named()
    // A string literal written inside math arrives as text content.
    let input = if type(input) == content and input.func() == text { input.text } else { input }
    let terms = if type(input) == str { _parse-string(input, s) } else { _parse-content(input, s) }
    math.equation(math.upright(_display(terms, s.options)))
  }
}
