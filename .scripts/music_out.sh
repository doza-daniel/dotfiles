 if [[ $(mpc | grep -o playing) ]]; then echo $(mpc | head -n1 | sed -e 's/^\s*-//g'); fi
