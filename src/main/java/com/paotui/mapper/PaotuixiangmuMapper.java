package com.paotui.mapper;

import com.paotui.entity.Paotuixiangmu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PaotuixiangmuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Paotuixiangmu record);

    int insertSelective(Paotuixiangmu record);

    Paotuixiangmu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Paotuixiangmu record);

    int updateByPrimaryKey(Paotuixiangmu record);

    List<Paotuixiangmu> selectAll(Map<String, Object> params);

    List<Paotuixiangmu> selectCanJiedan(@Param("keyword") String keyword, @Param("fenleiId") Integer fenleiId);
}
