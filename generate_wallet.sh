#
# Commands used for createing private testnet nodes and wallets
#

mkdir -p testnet

# set network type and its difficulty

NETTYPE=testnet
DIFFICULT=1


# create private wallets

# 56bCoEmLPT8XS82k2ovp5EUYLzBt9pYNW2LXUFsZiv8S3Mt21FZ5qQaAroko1enzw3eGr9qC7X1D7Geoo2RrAotYPx1iovY
echo "" | monero-wallet-cli --$NETTYPE --generate-new-wallet ~/$NETTYPE/wallet_01.bin  --restore-deterministic-wallet --electrum-seed="sequence atlas unveil summon pebbles tuesday beer rudely snake rockets different fuselage woven tagged bested dented vegan hover rapid fawns obvious muppet randomly seasons randomly" --password "" --log-file ~/$NETTYPE/wallet_01.log;

# 56VbjczrFCVZiLn66S3Qzv8QfmtcwkdXgM5cWGsXAPxoQeMQ79md51PLPCijvzk1iHbuHi91pws5B7iajTX9KTtJ4Z6HAo6
echo "" | monero-wallet-cli --$NETTYPE --generate-new-wallet ~/$NETTYPE/wallet_02.bin  --restore-deterministic-wallet --electrum-seed="deftly large tirade gumball android leech sidekick opened iguana voice gels focus poaching itches network espionage much jailed vaults winter oatmeal eleven science siren winter" --password "" --log-file ~/$NETTYPE/wallet_02.log;

# 5BXAsDboVYEQcxEUsi761WbnJWsFRCwh1PkiGtGnUUcJTGenfCr5WEtdoXezutmPiQMsaM4zJbpdH5PMjkCt7QrXAbj3Qrc
echo "" | monero-wallet-cli --$NETTYPE --generate-new-wallet ~/$NETTYPE/wallet_03.bin  --restore-deterministic-wallet --electrum-seed="upstairs arsenic adjust emulate karate efficient demonstrate weekday kangaroo yoga huts seventh goes heron sleepless fungal tweezers zigzags maps hedgehog hoax foyer jury knife karate" --password "" --log-file ~/$NETTYPE/wallet_03.log;


