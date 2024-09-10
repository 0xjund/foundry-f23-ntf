
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Test, console } from "forge-std/Test.sol";
import { DeployMoodNft } from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {

    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgaGVpZ2h0PSI0MDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiBmaWxsPSJ5ZWxsb3ciIHI9Ijc4IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjMiLz4KICA8ZyBjbGFzcz0iZXllcyI+CiAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIvPgogICAgPGNpcmNsZSBjeD0iMTI3IiBjeT0iODIiIHI9IjEyIi8+CiAgPC9nPgogIDxwYXRoIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiIHN0eWxlPSJmaWxsOm5vbmU7IHN0cm9rZTogYmxhY2s7IHN0cm9rZS13aWR0aDogMztpbmUiLz4KPC9zdmc+Cg==";
     
        string memory svg = "<svg viewBox='0 0 200 200' width='400' height='400' xmlns='http://www.w3.org/2000/svg'>"
            "<circle cx='100' cy='100' fill='yellow' r='78' stroke='black' stroke-width='3'/>"
            "<g class='eyes'>"
            "<circle cx='61' cy='82' r='12'/>"
            "<circle cx='127' cy='82' r='12'/>"
            "</g>"
            "<path d='m136.81 116.53c.69 26.17-64.11 42-81.52-.73' style='fill:none; stroke: black; stroke-width: 3;'/>"
            "</svg>";
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri))); 
    }

  //  function testFlipTokenToSad() public {
    //  vm.prank(USER);
      //moodNft.mintNft();

     // vm.prank(USER); 
     // moodNft.flipMood(0);

      //assert(keccak256(abi.encodePacked(moodNft.tokenURI(0))) == keccak256(abi.encodePacked(SAD_SVG_URI))); 
   // }
}

