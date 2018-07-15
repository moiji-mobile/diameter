
prepare_pharo60_vm() {
    echo "Using Pharo60+ VM"

    VM=pharo-linux-latest.zip
    wget -c http://files.pharo.org/get-files/70/$VM
    wget -c http://files.pharo.org/get-files/60/sources.zip

    rm -rf vm/
    mkdir -p vm/
    unzip -d vm/ $VM

    # And place the right Pharo6 sources into the VM directory.
    unzip -d vm/lib/pharo/*/ sources.zip

    # Pharo and --nodisplay
    PHAROVM=$PWD/vm/pharo
    PHAROARG="--nodisplay"
    PHAROTEST="--pharo-arg=$PHAROARG"
}

prepare_pharo60_img() {
    echo "Going to fetch latest Pharo60 image"
    VER=60539
    wget -c http://files.pharo.org/image/60/$VER.zip
    SUM=`sha256sum $VER.zip | cut -d ' ' -f 1`
    echo $SUM
    if [ "$SUM" != "1562578b14df41c031e5d79218aff00db07d8817786e9f493614a0297b6ee90d" ]; then
        echo "Smalltalk image has changed and should not have changed: $SUM"
        exit 23
    fi
    unzip $VER.zip
    mv Pharo*.image   Diameter.image
    mv Pharo*.changes Diameter.changes
}

function ci_test() {
   $PHAROVM $PHAROARG Diameter.image eval --save "Metacello new \
						baseline: 'Diameter'; \
						repository: 'filetree://$SRCDIR/mc/'; load."
   $PHAROVM $PHAROARG RoamingHub.image test --junit-xml-output "Diameter"
}

# Change directory
SRCDIR=$1
cd $SRCDIR
mkdir -p build
cd build

prepare_pharo60_vm
ci_test
