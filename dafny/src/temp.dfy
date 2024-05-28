   function transferFrom(address src, address dst, uint wad)
    public stoppable returns (bool) {
        if (src != msg.sender && allowance[src][msg.sender] != type(uint).max) {
            require(allowance[src][msg.sender] >= wad, "ds-token-insufficient-approval");
            allowance[src][msg.sender] = sub(allowance[src][msg.sender], wad);
        }

        require(balanceOf[src] >= wad, "ds-token-insufficient-balance");
        uint s = balanceOf[src] - wad;
        uint a = balanceOf[dst] + wad;

        balanceOf[src] = s;
        balanceOf[dst] = a;

        emit Transfer(src, dst, wad);

        return true;
    }