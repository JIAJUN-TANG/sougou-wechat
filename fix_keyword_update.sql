-- 修正版SQL脚本：添加keyword列并设置值

-- 步骤1：添加keyword列（如果不存在）
ALTER TABLE articles ADD COLUMN keyword TEXT;

-- 步骤2：将所有记录的keyword设置为"老年机器人"，并更新时间戳
UPDATE articles 
SET keyword = '老年机器人',
    updated_at = CURRENT_TIMESTAMP 
WHERE keyword IS NULL OR keyword = '';

-- 步骤3：查询更新结果
SELECT COUNT(*) AS total_articles, 
       COUNT(CASE WHEN keyword = '老年机器人' THEN 1 END) AS updated_articles
FROM articles;

-- 步骤4：查看前5条数据验证
SELECT id, title, keyword, updated_at 
FROM articles 
LIMIT 5;