import SimpleCrypto from "simple-crypto-js";
const cipherKey = "#ffg3$dvcv4rtkljjkh38dfkhhjgt";
const ethraw =
  "0x8207b7bbf486039b455923a402560ed041ad4b7243e9f329d6e415c00aaa9ef2";
const hhraw =
  "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";
export const simpleCrypto = new SimpleCrypto(cipherKey);
export const cipherEth = simpleCrypto.encrypt(ethraw);
export const cipherHH = simpleCrypto.encrypt(hhraw);

/*
HardHat Testnet
*/

export var hhresell = "0xCd55135cC103D7568056a828100D96603380DDbE";
export var hhnftcol = "0x45A755B058492558351f188e4362F0546Bc3d140";
var hhrpc = "http://localhost:8545";

/*
Global Parameters
*/
export var mainnet = hhrpc;
