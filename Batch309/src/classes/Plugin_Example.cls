public class Plugin_Example implements Process.Plugin{
    public Process.PluginResult invoke(Process.PluginRequest request){
    	Map<String,Object> inputs =request.inputParameters;
        String empName=(String)inputs.get('empName');
        Decimal exp=(Decimal)inputs.get('exp');
        Decimal salary,bonus;
        if(exp >5 ){
            salary=50000;
            bonus=5000;
        }else{
            salary=30000;
            bonus=3000;
        }
        Map<String,Object> outMap=new Map<String,Object>();
        outMap.put('Salary',salary);
        outMap.put('Bonus',bonus);
        Process.PluginResult result =new Process.PluginResult(outMap);
        return result;
    }
    public Process.PluginDescribeResult describe(){
        Process.PluginDescribeResult.Inputparameter ip1 =new Process.PluginDescribeResult.Inputparameter('empName',Process.PluginDescribeResult.ParameterType.String,true);
        Process.PluginDescribeResult.Inputparameter ip2 =new Process.PluginDescribeResult.Inputparameter('exp',Process.PluginDescribeResult.ParameterType.Decimal,true);
    	Process.PluginDescribeResult.Outputparameter op1 =new Process.PluginDescribeResult.Outputparameter('Salary',Process.PluginDescribeResult.parameterType.Decimal);
    	Process.PluginDescribeResult.outputParameter op2 =new Process.PluginDescribeResult.outputParameter('Bonus',Process.PluginDescribeResult.parameterType.Decimal);
    	Process.PluginDescribeResult result =new Process.PluginDescribeResult();
        result.inputparameters=new List<Process.PluginDescribeResult.Inputparameter>{ip1,ip2};
        result.outputparameters=new List<Process.PluginDescribeResult.outputParameter>{op1,op2};
        return result;
    }
}