pragma solidity >=0.4.21 <0.6.0;

import "./ERC20Interface.sol";
import "./DaiToken.sol";
import "./safemath.sol";

contract MovInfo {

    struct Movie {
        // string title;
        uint index;
        address movId; // wallet address of the movie
        uint goal; // amount of money. type check
        uint deadline;
        uint totalDeposit;

    }

    Movie[] public movies;
    mapping (address => Movie) mov;

    uint public index;
    // address public director;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function newMovInfo(address _movId, uint _goal, uint _deadline) public {
        index = movies.length;
        movies.push(Movie(index, _movId, _goal, _deadline, 0));
    }

    /*
    출력됐으면 좋겠다고 했던 것 같아서 위아래 아무거나 써
    function newMovInfo(address _movId, uint _goal, uint _deadline) public returns(address, uint, uint, uint) {
        index = movies.length;
        movies.push(Movie(index, _movId, _goal, _deadline, 0));
        return (movies[_index].movId, movies[_index].goal, movies[_index].deadline, movies[_index].totalDeposit);
    }
    */

    /*
    // array testing
    function moviesReturn(uint _index) public view returns(uint) {
        return movies[_index].goal;
    }
    */


}