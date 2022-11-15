// global variables
var el = document.getElementById("result")
var operands_inputlist = [];
var operator_inputlist = [];
var operators = ["+", "-", "/", "X"];
var displaynum = "";

// call when caluculate
function calculateList(list_nums, list2_ope) {
    let calculate_result = parseFloat(list_nums[0])
    for(let i = 1; i < list_nums.length; i++) {
        if(list2_ope[i-1] == "X") {
            calculate_result =  calculate_result * parseFloat(list_nums[i])
            continue
        }else if (list2_ope[i-1] == "/") {
            calculate_result =  calculate_result / parseFloat(list_nums[i])
            continue
        } else {
            calculate_result =  calculate_result + parseFloat(list2_ope[i-1] + list_nums[i])
        }
    }
    // after calculate reset two lists for next calculate
    list2_ope.shift()
    list_nums = []
    list_nums.push(calculate_result)
    // display calculate result
    el.innerHTML = calculate_result;
    return [list_nums, list2_ope]

}


// clear the display
function clearDis() {
    el.innerHTML = "0";
    operands_inputlist = [];
    operator_inputlist = [];
    displaynum = "";
};

// get input and display
function display(input) {
    // when input is a number
    if(!operators.includes(input)) {
        displaynum += input;
        el.innerHTML = displaynum;
    
    // when input is an operator
    }else{
        operands_inputlist.push(displaynum)
        if(operator_inputlist.length >= 1) {
            // do calculate and display result
            result_list = calculateList(operands_inputlist, operator_inputlist)
            operands_inputlist = result_list[0];
            operator_inputlist = result_list[1];
        }

        operator_inputlist.push(input)
        // reset variable for display
        displaynum = ""
    }

};

// "=" was clicked, then calucurate
function calculateDis() {
    // push the display number to operands_inputlist
    operands_inputlist.push(displaynum)
    if(operands_inputlist.length != 0 && operator_inputlist.length != 0) {
        // calculate result
        calculateList(operands_inputlist, operator_inputlist);
        // reset two lists
        operands_inputlist = [];
        operator_inputlist = [];
    }
}