
--TD 分片表修改复制表
--标准操作规范


- 1：创建复制表的表结构，表结构与原表相同
create table t_ant_org_region_manage_0818 (like t_ant_org_region_manage including all) distribute by replication ;

set lock_timeout=5000;

- 2：原表改名
alter table t_ant_org_region_manage rename to t_ant_org_region_manage_ori_0818 ;
- 3：导入数据到新表
insert into t_ant_org_region_manage_0818 select * from t_ant_org_region_manage_ori_0818 ;

- 4：收集新表统计信息
vacuum analyze t_ant_org_region_manage_0818 ;

- 5：将新表改名为原表名
alter table t_ant_org_region_manage_0818 rename to t_ant_org_region_manage ;