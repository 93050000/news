package edu.gdkm.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.gdkm.po.News;
import org.junit.Test;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JsonUtile {
    public static String getJSON(Object object) throws JsonProcessingException {
        ObjectMapper objectMapper=new ObjectMapper();
        String s = objectMapper.writeValueAsString(object);
        return s;
    }
    public static String getDate(){
        Date date = new Date();
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sd.format(date);
        return format;
    }
    //500
    public  static String setErrMap(int start,String  test) throws JsonProcessingException {
        Map<String,String> map=new HashMap<String, String>();
        map.put("start",start+"");
        map.put("test",test);
        return JsonUtile.getJSON(map);
    }
    //200
    public static  String setErrMap200(String test) throws JsonProcessingException {
        return setErrMap(200,test);
    }
    /*该方法 统一把空支付转换成null*/
    public static Object getObjet(Object object){
        //循环遍历OaInfoAssess实体中的属性与值
        for (Field field : object.getClass().getDeclaredFields()){

            //设置可以获取私人属性
            field.setAccessible(true);

            try {
                Class type = field.getType();// 得到此属性的类型
                if(type == String.class){
                    //属性名
                    String valueName =field.getName();
                    //属性值
                    String  value=(String)field.get(object);
                    //更新属性
                    if(value==null||value.equals("")){
                        field.set(object,null);
                    }
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return object;
    }
    /*判断是否都为Null*/
    public static boolean getNullTrue(Object object){
        //循环遍历OaInfoAssess实体中的属性与值
        boolean bue=true;
        for (Field field : object.getClass().getDeclaredFields()){
            //设置可以获取私人属性
            field.setAccessible(true);

            try {
                Class type = field.getType();// 得到此属性的类型
                if(type == Integer.class){
                    //属性名
                    String valueName =field.getName();
                    //属性值
                    Integer  value=(Integer)field.get(object);
                    //更新属性

                    if(value!=null){
//                        field.set(object,null);
                        bue=false;
                    }
                }
                if(type == String.class){
                    //属性名
                    String valueName =field.getName();
                    //属性值
                    String  value=(String)field.get(object);
                    //更新属性


                    if(value!=null){
//                        field.set(object,null);
                        bue=false;
                    }
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return bue;
    }
}
