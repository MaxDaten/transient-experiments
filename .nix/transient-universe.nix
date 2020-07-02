{ mkDerivation, aeson, base, base64-bytestring, bytestring
, case-insensitive, containers, directory, fetchgit, filepath
, hashable, HTTP, iproute, mtl, network, network-info, network-uri
, old-time, process, random, stdenv, stm, TCache, text, time
, transformers, transient, vector, websockets
}:
mkDerivation {
  pname = "transient-universe";
  version = "0.5.2";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1ygpqfsgxc6sbd91fcyi4i78nds1l680krjww9r281rsvmmk3j1l";
    rev = "b10d3912ee430b41a097725a1b4aec1b9a1620c6";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/transient-universe; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP iproute mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  executableHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  testHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  jailbreak = true;
  doCheck = false;
  homepage = "https://github.com/transient-haskell/transient-universe";
  description = "Remote execution and map-reduce: distributed computing for Transient";
  license = stdenv.lib.licenses.mit;
}
