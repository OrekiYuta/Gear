public class Polymorphism {
    public static class A{
        public String show(D obj){
            return ("A and D");
        }
        public String show(A obj){
            return ("A and A");
        }
    }
    public static class B extends A{
        public String show(B obj){
            return("B and B");
        }
        public String show(A obj){
            return("B and A");
        }
    }
    public static class C extends B{
    }
    public static class D extends B{
    }


    public static void main(String[] args){
        A a1 = new A();//实例化一个A类型的对象a1，引用A类型的实例
        A a2 = new B();//实例化一个A类型的对象a2,引用B类型的实例,B类是A类的子类，会对A类同名方法进行覆盖

        B b = new B();
        C c = new C();
        D d = new D();

        System.out.println(a1.show(b));//B类继承了A类，所以B类型的对象b也属于A类型，所以在A类型的对象a1的方法中找到(A obj)
        System.out.println(a1.show(c));//C类型继承了B类型，B类型继承了A类型;所以C类型属于B类型，也属于A类型，所以同样在A类型的对象a1的方法中找到(A obj)
        System.out.println(a1.show(d));

        System.out.println(a2.show(b));/*a2对象中的方法有
                                                public String show(D obj){return("A and D");}
                                                public String show(B obj){return("B and B");}
                                                public String show(A obj){return("B and A");}
                                        由于B类继承了A类，所以b对象的类优先级为[A类>B类]，所以会先从符合A类型的开始找，符合(A obj)
                                        */
        System.out.println(a2.show(c));//C类型继承了B类型，B类型继承了A类型;所以c对象的类优先级为[A类>B类>C类]，同理先找A类型，符合(A obj)
        System.out.println(a2.show(d));

        System.out.println(b.show(b));
        System.out.println(b.show(c));
        System.out.println(b.show(d));
    }
}
