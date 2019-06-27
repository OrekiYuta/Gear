import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.util.List;

public class Scan {
    //输入psvm 回车 快速创建main方法
    public static void main(String[] args) {
        /*01*************************/
        //设置webdriver路径
        System.setProperty("webdriver.chrome.driver",Scan.class.getClassLoader().getResource("chromedriver.exe").getPath());

        
        /*02*************************/
        //创建 webdriver
        WebDriver webDriver =new ChromeDriver();

        
        /*03*************************/
        // 打开页面
        webDriver.get("https://www.lagou.com/zhaopin/Java/?labelWords=label");

        webDriver.findElement(By.xpath("//li[@class='multi-chosen']//span[contains(text(),'工作经验')]"));
        /*04*************************/
        //第一步
        /*通过 xpath 选中元素
        WebElement chosenElement = webDriver.findElement(By.xpath("//li[@class='multi-chosen']//span[contains(text(),'工作经验')]"));
        WebElement optionElement = chosenElement.findElement(By.xpath("../a[contains(text(),'应届毕业生')]"));
        optionElement.click();
        */

        //再次观察页面,发现各个选项只有文本描述差异,所以接下来把上面两个文本抽成变量(选中"工作经验"ctrl+alt+v)

        //第二步
        /*
        String chosenTitle = "工作经验";
        String optionTitle = "应届毕业生"; //移动代码位置(先选择该行ctrl+shift+↑)

        WebElement chosenElement = webDriver.findElement(By.xpath("//li[@class='multi-chosen']//span[contains(text(),'" + chosenTitle + "')]"));
        WebElement optionElement = chosenElement.findElement(By.xpath("../a[contains(text(),'" + optionTitle + "')]"));
        optionElement.click();
        */

        //然后思考,把上面三行抽成方法,之后只需传递两个参数就可以控制了
        //(选中上面三行代码,ctrl+alt+M 抽成方法)该操作前需要做第二步的提取变量

        //第三步
        /*
        String chosenTitle = "工作经验";
        String optionTitle = "应届毕业生";
        clickOption(webDriver, chosenTitle, optionTitle);
        */

        //再把文本传回方法参数里 ctrl+alt+N (选中方法里的参数)

        //第四步
        clickOption(webDriver, "工作经验", "应届毕业生");//接着分析页面,执行五个操作
        clickOption(webDriver, "学历要求", "本科");
        clickOption(webDriver, "融资阶段", "不限");
        clickOption(webDriver, "公司规模", "不限");
        clickOption(webDriver, "行业领域", "移动互联网");


        /*05*************************/
        //解析页面元素

        //第一步
        /*
        //webDriver.findElements(By.className("con_list_item"));这里findElements是因为有多个元素,上面的findElement是只有一个元素
        //接着依然是抽取变量ctrl+alt+v

        //接下来循环遍历 jobElements ;下面输入 jobElemnets.for 就会补全语法
        //sout 快速创建打印方法

        for (WebElement jobElement : jobElements) {
            WebElement moneyElement = jobElement.findElement(By.className("position")).findElement(By.className("money"));
            System.out.println(moneyElement.getText());
            String companyName = jobElement.findElement(By.className("company_name")).getText();
            System.out.println(companyName);
        }
        */
        //思考,把第一步代码抽成方法

        //第二步
        extractJobsByPagination(webDriver);

    }

    private static void extractJobsByPagination(WebDriver webDriver) {
        List<WebElement> jobElements = webDriver.findElements(By.className("con_list_item"));
        for (WebElement jobElement : jobElements) {
            WebElement moneyElement = jobElement.findElement(By.className("position")).findElement(By.className("money"));
            String companyName = jobElement.findElement(By.className("company_name")).getText();
            System.out.println(companyName + " : " + moneyElement.getText());
        }
        //第三步,分析页面元素的分页标签属性和事件后
        WebElement nextPageBtn = webDriver.findElement(By.className("pager_next"));
        if(!nextPageBtn.getAttribute("class").contains("pager_next_disabled")){
            nextPageBtn.click();
            System.out.println("--------下一页---------");
            //然后这里让线程睡眠一秒钟,以免跳转响应时间不够,再来个异常处理
            try {
                Thread.sleep(1000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            extractJobsByPagination(webDriver);
        }
    }

    private static void clickOption(WebDriver webDriver, String chosenTitle, String optionTitle) {
        WebElement chosenElement = webDriver.findElement(By.xpath("//li[@class='multi-chosen']//span[contains(text(),'" + chosenTitle + "')]"));
        WebElement optionElement = chosenElement.findElement(By.xpath("../a[contains(text(),'" + optionTitle + "')]"));
        optionElement.click();
    }
    
}
