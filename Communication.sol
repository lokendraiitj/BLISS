// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./Common.sol";

contract Communication is Common {
    function validateCommunication(uint256 deviceId_sender, uint256 clusterId_sender, uint256 deviceId_receiver, uint256 clusterId_receiver, address sender, address receiver) public returns (bool) {
        if (!isAvailableDeviceID(deviceId_sender) || !isAvailableDeviceID(deviceId_receiver)) {
            return false;
        }
        if (clusterId_sender != clusterId_receiver) {
            return false;
        }
        if (sender != mappingTodeviceId[deviceId_sender] || receiver != mappingTodeviceId[deviceId_receiver]) {
            return false;
        }
        return true;
    }
}