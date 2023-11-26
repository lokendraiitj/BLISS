// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./Common.sol";

contract JoinCluster is Common {
    function validatejoinCluster(uint256 deviceId, uint256 clusterId, string memory C) public returns (bool) {
        if (!isAvailableDeviceID(deviceId)) {
            return false;
        } else if (keccak256(abi.encodePacked(C)) == keccak256(abi.encodePacked("controller"))) {
            if (!isAvailableClusterID(clusterId)) {
                return false;
            }
        } else if (keccak256(abi.encodePacked(C)) == keccak256(abi.encodePacked("candidate"))) {
            if (!isAvailableClusterID(clusterId) || msg.sender != mappingToclusterId[clusterId]) {
                return false;
            }
        }
        return true;
    }
}