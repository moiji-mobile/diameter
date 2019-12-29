| conn dialoguesManager | 
dialoguesManager := DiameterDialogues new.
conn := DiameterS6aNetworkServiceOsmoDirect new
    diameterDialoguesMgr: dialoguesManager;
    localHost: 'dev.rh0.sbg.epc.mnc840.mcc310.3gppnetwork.org';
    localRealm: 'rh0.sbg.epc.mnc840.mcc310.3gppnetwork.org';
    hostname: '127.0.0.1' port: 3869;
    yourself.

conn start.
