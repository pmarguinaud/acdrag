#!/bin/bash 

# METEO_SRC=/home/legaux/meteo/models/

# ./loki-transform.py convert --mode scc --path $METEO_SRC/acdrme/ --out-path $METEO_SRC/acdrme_out/

./loki-transform.py convert --mode scc --frontend=fp --path ../src/ --out-path ../src_scc/

