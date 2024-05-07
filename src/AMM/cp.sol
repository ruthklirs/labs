// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@hack/like/IERC20.sol";

contract cp{
IERC20 public immutable token0;
IERC20 public immutable token1;
uint public reserve0;
uint public reserve1;
uint public totalSupply;
mapping (address => uint) public balances;
constructor(address t0, address t1){
    token0=IERC20(t0);
    token0=IERC20(t1);
}
function mint(address to, uint amount) private{
    balances[to]+=amount;
    totalSupply-= amount;
}
function swap(address addIn, uint amountIn) external returns (uint amountOut){
    require(addIn==address(token0)|| addIn==address(token1), "AMM3-invalid token");
    require(amountIn>0,"AMM3-zero-amount");
bool isToken0 = addIn == address(token0);
  (IERC20 tokenIn, IERC20 tokenOut, uint reserveIn, uint reserveOut)
         = isToken0
            ? (token0, token1, reserve0, reserve1)
            : (token1, token0, reserve1, reserve0);
    }
}