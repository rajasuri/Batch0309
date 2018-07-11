trigger Account_Example on Account (before insert) {
    Recursive_Trigger_Example.call();
}