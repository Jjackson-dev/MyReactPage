pragma solidity >=0.4.21 <0.6.0;

contract Reward {
    struct RewardInfo {
        address movId; // wallet address of the movie
        address director;
        string rewardType;
        uint rewardDL; // reward DeadLine
        bool isGiven; // true if all the bettors got rewards
    }

    mapping (string => RewardInfo) rewards;

    address public owner;
    address public director;
    //string public title;

    constructor() public {
        owner = msg.sender;
    }

    function newRewardInfo(string memory _title, address _movId, address _director,
                             string memory _rewardType,  uint _rewardDL, bool _isGiven) public {
        rewards[_title] = RewardInfo(_movId, _director, _rewardType, _rewardDL, _isGiven);
    }

    // // now == block.timestamp (uint type)
    // function checkReward(string memory _title) public view returns (bool) {
    //     require(now >= rewards[_title].rewardDL, "[ERROR!] days left");
    //     return rewards[_title].isGiven;
    // }
}