
--
-- 表的结构 `cmf_car_brand`
--

CREATE TABLE IF NOT EXISTS `cmf_car_brand` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '品牌父id',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '品牌车数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌车页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='car应用 车品牌表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_car_brand_element`
--

CREATE TABLE IF NOT EXISTS `cmf_car_brand_element` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '车id',
  `brand_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '品牌id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='car应用 品牌车对应表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_car_element`
--

CREATE TABLE IF NOT EXISTS `cmf_car_element` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `element_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型,1:车;2:页面',
  `element_format` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `element_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_hits` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '查看数',
  `element_like` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `element_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'element标题',
  `element_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `element_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'element摘要',
  `element_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载车的来源',
  `element_content` text COMMENT '车内容',
  `element_content_filtered` text COMMENT '处理过的车内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`element_type`,`element_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='car应用 车表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_car_tag`
--

CREATE TABLE IF NOT EXISTS `cmf_car_tag` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `element_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签车数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='car应用 车标签表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_car_tag_element`
--

CREATE TABLE IF NOT EXISTS `cmf_car_tag_element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签 id',
  `element_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '车 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='car应用 标签车对应表';

-- --------------------------------------------------------


-- 增缩略图字段
ALTER TABLE `cmf_car_element` ADD `thumbnail` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '缩略图' AFTER `element_source`;
ALTER TABLE `cmf_car_element` ADD `element_favorites` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数' AFTER `element_hits`;
