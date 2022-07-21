<template>
  <section>
    <div><mtHeader /></div>
    <div style="padding: 30px 0 0 30px;">
        <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
          <el-tab-pane label="掘金进行中" name="first">掘金进行中</el-tab-pane>
          <el-tab-pane label="掘金已结束" name="second">掘金已结束</el-tab-pane>
        </el-tabs>
    </div>

  </section>
</template>
<script setup >
import { ref } from 'vue'
import mtHeader from "../components/Header.vue"
// import type { TabsPaneContext } from 'element-plus'

const activeName = ref('first')
// const handleClick = (tab: TabsPaneContext, event: Event) => {
//   console.log(tab, event)
// }
</script>

<style>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>