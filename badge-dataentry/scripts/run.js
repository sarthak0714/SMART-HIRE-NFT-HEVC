const main = async () => {
    const nftContractFactory= await hre.ethers.getContractFactory("badge2");
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to: ",nftContract.address);
    let txn = await nftContract.makeBadge2()
    await txn.wait()

};
const runMain = async () => {
    try{
        await main();
        process.exit(0);

    }catch(error){
        console.log(error);
        process.exit(1);
    }
};

runMain();