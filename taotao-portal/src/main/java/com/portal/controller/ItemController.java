package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.util.JsonUtils;
import com.portal.service.ItemService;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemDesc;
import com.taotao.pojo.TbItemParamItem;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Reference
    private ItemService itemService;

    /**
     * 根据ID获取商品信息
     * @param itemId
     * @param model
     * @return
     */
    @RequestMapping("/{itemId}")
    public String showItem(@PathVariable Long itemId, Model model) {

        TaotaoResult restult = itemService.getItemBaseInfo(itemId);
        TbItem item=(TbItem) restult.getData();
        model.addAttribute("item", item);
        System.out.println("是我");
        return "item";
    }


    /**
     * 商品描述
     * @param itemId
     * @return
     */
    @RequestMapping(value="/desc/{itemId}", produces=MediaType.TEXT_HTML_VALUE+";charset=utf-8")
    @ResponseBody
    public String getItemDesc(@PathVariable Long itemId) {

        System.out.println("id"+itemId);
        TaotaoResult result=itemService.getItemDesc(itemId);
        TbItemDesc desc=(TbItemDesc) result.getData();
        String s = null;
        try{
            s=desc.getItemDesc();
        }catch (Exception e){
            e.printStackTrace();

            return"该商品没有详细信息";
        }
        return s;
    }


    @RequestMapping(value="/param/{itemId}",
            produces=MediaType.TEXT_HTML_VALUE+";charset=utf-8")
    @ResponseBody
    public String getItemParam(@PathVariable Long itemId) {

        TaotaoResult result=itemService.getItemParam(itemId);
        TbItemParamItem param= (TbItemParamItem) result.getData();
        String paramData = param.getParamData();
        //生成html
        // 把规格参数json数据转换成java对象
        List<Map> jsonList = JsonUtils.jsonToList(paramData, Map.class);
        StringBuffer sb = new StringBuffer();
        sb.append("<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" border=\"0\" class=\"Ptable\">\n");
        sb.append("    <tbody>\n");
        for(Map m1:jsonList) {
            sb.append("        <tr>\n");
            sb.append("            <th class=\"tdTitle\" colspan=\"2\">"+m1.get("group")+"</th>\n");
            sb.append("        </tr>\n");
            List<Map> list2 = (List<Map>) m1.get("params");
            for(Map m2:list2) {
                sb.append("        <tr>\n");
                sb.append("            <td class=\"tdTitle\">"+m2.get("k")+"</td>\n");
                sb.append("            <td>"+m2.get("v")+"</td>\n");
                sb.append("        </tr>\n");
            }
        }
        sb.append("    </tbody>\n");
        sb.append("</table>");

        //返回html片段
        return sb.toString();


}


}
