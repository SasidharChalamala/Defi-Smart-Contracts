// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAMM {

    // Token reserves
    uint public reserveA;
    uint public reserveB;

    // Owner
    address public owner;

    // Events
    event LiquidityAdded(uint amountA, uint amountB);
    event Swapped(string direction, uint amountIn, uint amountOut);

    constructor() {
        owner = msg.sender;
    }

    // Add liquidity to pool
    function addLiquidity(uint amountA, uint amountB) public {
        require(msg.sender == owner, "Not owner!");
        require(amountA > 0 && amountB > 0, "Invalid amounts!");

        reserveA += amountA;
        reserveB += amountB;

        emit LiquidityAdded(amountA, amountB);
    }

    // Swap Token A for Token B
    function swapAforB(uint amountA) public returns (uint amountB) {
        require(amountA > 0, "Invalid amount!");
        require(reserveA > 0 && reserveB > 0, "No liquidity!");

        // x * y = k formula
        // (reserveA + amountA) * newReserveB = reserveA * reserveB
        uint k = reserveA * reserveB;
        uint newReserveA = reserveA + amountA;
        uint newReserveB = k / newReserveA;

        amountB = reserveB - newReserveB;

        // Apply 0.3% fee
        amountB = amountB * 997 / 1000;

        // Update reserves
        reserveA = newReserveA;
        reserveB = newReserveB;

        emit Swapped("A->B", amountA, amountB);
        return amountB;
    }

    // Swap Token B for Token A
    function swapBforA(uint amountB) public returns (uint amountA) {
        require(amountB > 0, "Invalid amount!");
        require(reserveA > 0 && reserveB > 0, "No liquidity!");

        // x * y = k formula
        uint k = reserveA * reserveB;
        uint newReserveB = reserveB + amountB;
        uint newReserveA = k / newReserveB;

        amountA = reserveA - newReserveA;

        // Apply 0.3% fee
        amountA = amountA * 997 / 1000;

        // Update reserves
        reserveA = newReserveA;
        reserveB = newReserveB;

        emit Swapped("B->A", amountB, amountA);
        return amountA;
    }

    // Get current price of A in terms of B
    function getPrice() public view returns (uint) {
        require(reserveA > 0, "No liquidity!");
        return reserveB / reserveA;
    }

    // Get reserves
    function getReserves() public view
    returns (uint _reserveA, uint _reserveB) {
        return (reserveA, reserveB);
    }
}
