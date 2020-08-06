#!/bin/bash

# tmux session name
SN=PRIVXMR

tmux kill-session -t $SN

mkdir -p ./testnet 

# nodes window

# start node_01 (initial session)
tmux new-session -d -s $SN -n nodes -- sh -ic 'echo node_01 && ./monerod --testnet  --no-igd --hide-my-port --data-dir ./testnet/node_01 --p2p-bind-ip 127.0.0.1 --log-level 0 --add-exclusive-node 127.0.0.1:38080 --add-exclusive-node 127.0.0.1:48080  --fixed-difficulty 100 || read WHATEVER'

# start node_02
tmux split-window -dv
tmux select-pane -t 1
tmux split-window -dh      -- sh -ic 'echo node_02 && ./monerod --testnet --p2p-bind-port 38080 --rpc-bind-port 38081 --zmq-rpc-bind-port 38082 --no-igd --hide-my-port --log-level 0 --data-dir ./testnet/node_02 --p2p-bind-ip 127.0.0.1 --add-exclusive-node 127.0.0.1:28080 --add-exclusive-node 127.0.0.1:48080 --fixed-difficulty 100 || read WHATEVER'

# start node_03
tmux select-pane -t 0
tmux split-window -dh      -- sh -ic 'echo node_03 && ./monerod --testnet --p2p-bind-port 48080 --rpc-bind-port 48081 --zmq-rpc-bind-port 48082 --no-igd --hide-my-port --log-level 0 --data-dir ./testnet/node_03 --p2p-bind-ip 127.0.0.1 --add-exclusive-node 127.0.0.1:28080 --add-exclusive-node 127.0.0.1:38080 --fixed-difficulty 100 || read WHATEVER'


# wallets window

# start wallet_01 (first pane in new window)
tmux new-window -n wallets -- sh -ic 'sleep 5s && echo wallet_01 && ./monero-wallet-rpc --testnet --disable-rpc-login --rpc-bind-port 28083 --daemon-address 127.0.0.1:28081 --trusted-daemon --wallet-file ./testnet/wallet_01.bin --password "" --log-file ./testnet/wallet_01.log || read WHATEVER'

# start wallet_02
tmux split-window -dv
tmux select-pane -t 1
tmux split-window -dh       -- sh -ic 'sleep 5s && echo wallet_02 && ./monero-wallet-rpc --testnet --disable-rpc-login --rpc-bind-port 38083 --daemon-address 127.0.0.1:38081 --trusted-daemon --wallet-file ./testnet/wallet_02.bin --password "" --log-file ./testnet/wallet_02.log || read WHATEVER'

# start wallet_03
tmux select-pane -t 0
tmux split-window -dh       -- sh -ic 'sleep 5s && echo wallet_03 && ./monero-wallet-rpc --testnet --disable-rpc-login --rpc-bind-port 48083 --daemon-address 127.0.0.1:48081 --trusted-daemon --wallet-file ./testnet/wallet_03.bin --password "" --log-file ./testnet/wallet_03.log || read WHATEVER'


# explorer window
# start the explorer for the private testnet network

#cd ~/onion-monero-blockchain-explorer/build 
#tmux new-window -n explorer -- sh -ic "echo xmrblocks && ./xmrblocks -t -p 9999 -b $HOME/testnet/node_01/testnet/lmdb/ --no-blocks-on-index 50 --enable-as-hex --enable-pusher || read WHATEVER"

#tmux split-window -v
#tmux select-pane -t 0

# open second (wallets) tmux window
#tmux select-window -t 1

# open tmux for this session
tmux a -t $SN
