// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RealEstate
 * @author Jacob Adelzadeh
 * @notice ERC20-based token representing tokenized real-estate shares.
 * @dev Owner has exclusive rights to mint and burn tokens.
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @notice RealEstate token contract.
 * @dev Inherits ERC20 standard implementation and Ownable access control.
 */
contract RealEstate is ERC20, Ownable(msg.sender) {

    /// @notice Custom decimals value for the token
    uint8 private decimals_;

    /**
     * @notice Initializes the RealEstate token.
     * @param _name Token name (e.g., "Dubai Property Token")
     * @param _symbol Token symbol (e.g., "DPT")
     * @param _decimals Number of decimals used by the token
     *
     * @dev Owner is set via Ownable(msg.sender).
     */
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) ERC20(_name, _symbol) {
        decimals_ = _decimals;
    }

    /*//////////////////////////////////////////////////////////////
                            ERC20 OVERRIDES
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Returns the number of decimals used to display balances.
     * @dev Overrides OpenZeppelin ERC20 default (18).
     */
    function decimals() public view override returns (uint8) {
        return decimals_;
    }

    /*//////////////////////////////////////////////////////////////
                        OWNER-CONTROLLED ACTIONS
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Mints new tokens to a specified address.
     * @param to Recipient address.
     * @param amount Amount of tokens to mint.
     *
     * @dev Only callable by contract owner.
     * Typically used when issuing new real-estate shares.
     */
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    /**
     * @notice Burns tokens from a specified address.
     * @param from Address whose tokens will be burned.
     * @param amount Amount of tokens to burn.
     *
     * @dev Only callable by contract owner.
     * Useful for buybacks, redemptions, or supply adjustments.
     */
    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}
