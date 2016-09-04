package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.Conf;
import com.eazy.brush.dao.mapper.ConfMapper;
import com.eazy.brush.service.ConfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/29 23:26
 */
@Service
public class ConfServiceImpl implements ConfService {

    @Autowired
    ConfMapper confMapper;

    @Override
    public void insert(Conf conf) {
        confMapper.insert(conf);
    }

    @Override
    public List<Conf> getList(int offset, int size) {
        return confMapper.getList(offset, size);
    }

    @Override
    public Conf getByKey(String key) {
        return confMapper.getByKey(key);
    }

    @Override
    public Number getNumberValueByKey(String key) {
        Conf conf = getByKey(key);
        if (null == conf) {
            return 0;
        }
        return Double.valueOf(conf.getValue());
    }

    @Override
    public void update(Conf conf) {
        confMapper.udpate(conf);
    }
}
