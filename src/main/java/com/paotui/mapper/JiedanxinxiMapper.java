package com.paotui.mapper;

import com.paotui.entity.Jiedanxinxi;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface JiedanxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Jiedanxinxi record);

    int insertSelective(Jiedanxinxi record);

    Jiedanxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Jiedanxinxi record);

    int updateByPrimaryKey(Jiedanxinxi record);

    List<Jiedanxinxi> selectAll(Map<String, Object> params);

    Jiedanxinxi selectByOrderNo(String orderNo);

    Jiedanxinxi selectByProjectIdAndPaotuiId(@Param("projectId") Integer projectId, @Param("paotuiId") Integer paotuiId);
}
