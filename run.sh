/steamcmd/steamcmd.sh +force_install_dir /arma_reforger +login $STEAM_USER $STEAM_PW +app_update $APPID validate +exit

cd /reforger
./ArmaReforgerServer -config "/configs/server.json" -profile "/profile" -backendlog -nothrow