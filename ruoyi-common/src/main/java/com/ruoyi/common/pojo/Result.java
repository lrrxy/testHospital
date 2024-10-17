package com.ruoyi.common.pojo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("返回结果属性")
public class Result implements Serializable {
   @ApiModelProperty(value = "响应码，1 代表成功; 0 代表失败")
    private Integer code;
    @ApiModelProperty(value = "响应信息 描述字符串")
    private String msg;
    @ApiModelProperty(value = "返回的数据")
    private Object data;

    //增删改 成功响应
    public static Result success(){
        return new Result(1,"操作成功",null);
    }
    //查询 成功响应
    public static Result success(Object data){
        return new Result(1,"操作成功",data);
    }

    //失败响应
    public static Result error(String msg){
        return new Result(0,msg,null);
    }

    //未携带token
    public static Result error(int code,String msg){
        return new Result(code,msg,null);
    }
}

