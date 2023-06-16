pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

var jsonData = pm.response.json();
var result="";
var pmEvVariable="";
var tldDomain = pm.environment.get("TLD-com");

for (let index = 0; index < jsonData.words.length ; index++) {
    if(index == jsonData.words.length -1){
        result += jsonData.words[index].word;
        pmEvVariable += "\""+jsonData.words[index].word +tldDomain+"\"";
        break;
    }
    result += jsonData.words[index].word +",";
    pmEvVariable += "\""+jsonData.words[index].word +tldDomain+"\""+",";
};

// console.log(result);

pm.test("count: "+jsonData.words.length);

pm.test(result);

pm.test("have more: "+jsonData.more)

// set to postman environment

// set to current environment ,pls check current environment,Look at the top right corner ↑
// pm.test(jsonData.words[0].word.length);
// according request char size to set to each size pm env variable
// pm.environment.set(jsonData.words[0].word.length+"char", pmEvVariable);

// pm.test("set to EV: "+jsonData.words[0].word.length+"char "+pmEvVariable);
// pm.test("set to EV: allchar "+pmEvVariable);