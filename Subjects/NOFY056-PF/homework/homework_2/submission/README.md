# Návod k použití

## Python verze
- Zobrazení různých Lissajousových křivek přes matplotlib
```bash
python3 main.py --preview
```


- Vypsání bodů do .dat souborů
```bash
python3 main.py --dump_dat
```

- Vypsání gnuplot skriptů které po spuštění vykreslí obrázek
```bash
python3 main.py --dump_gnuplot
```

## Fortran verze
- Sestavení programu
```bash
make build
```

- Spuštění programu - vypíše body křivky do souboru `lissajous.dat`
```bash
make run
```
