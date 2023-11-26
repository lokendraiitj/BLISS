// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Common {
    uint256[] public deviceIds;
    uint256[] public clusterIds;
    mapping(uint256 => address) public mappingTodeviceId;
    mapping(uint256 => address) public mappingToclusterId;

    function createDevicePool(address add, uint256 deviceId) public {
        mappingTodeviceId[deviceId] = add;
        deviceIds.push(deviceId);
    }

    function createClusterPool(address add, uint256 clusterId) public {
        mappingToclusterId[clusterId] = add;
        clusterIds.push(clusterId);
    }

    event ClusterFound(address owner);
    event DeviceFound(address owner);

    function isAvailableDeviceID(uint256 deviceId) public returns (bool) {
        if (deviceIds.length < 1) {
            return false;
        }
        if (mappingTodeviceId[deviceId] != address(0)) {
            emit DeviceFound(mappingTodeviceId[deviceId]);
            return true;
        } else {
            emit DeviceFound(msg.sender);
            return false;
        }
    }

    function isAvailableClusterID(uint256 clusterId) public returns (bool) {
        if (clusterIds.length < 1) {
            return false;
        }
        if (mappingToclusterId[clusterId] != address(0)) {
            emit ClusterFound(mappingToclusterId[clusterId]);
            return true;
        } else {
            emit ClusterFound(msg.sender);
            return false;
        }
    }
}