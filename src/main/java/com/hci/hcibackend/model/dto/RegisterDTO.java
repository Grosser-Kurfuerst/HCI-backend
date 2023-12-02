package com.hci.hcibackend.model.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;


@Data
public class RegisterDTO {

    @NotEmpty(message = "请输入账号")
    @Size(min = 2, max = 15, message = "长度在2-15")
    private String name;

    @NotEmpty(message = "请输入密码")
    @Size(min = 6, max = 20, message = "长度在6-20")
    private String pass;

    @NotEmpty(message = "请再次输入密码")
    @Size(min = 6, max = 20, message = "长度在6-20")
    private String checkPass;

    @NotEmpty(message = "请输入电子邮箱")
    @Email(message = "邮箱格式不正确")
    private String email;
}
