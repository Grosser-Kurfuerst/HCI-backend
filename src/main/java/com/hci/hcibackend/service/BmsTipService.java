package com.hci.hcibackend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hci.hcibackend.model.entity.BmsTip;

public interface BmsTipService extends IService<BmsTip> {
    BmsTip getRandomTip();
}
