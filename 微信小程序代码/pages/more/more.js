// pages/goods_list/index.js
import request from '../../utils/request.js'
Page({

  /**
   * 页面的初始数据
   */
  data: {
  
    //商品列表数据
    goodsList: [
  
  ],
  },

  //接口要的参数
  QueryParams: {
    query: "",
    cid: "",
    pagenum: 1,
    pagesize: 10
  },
  //总页数
  totalPages: 1,
  details: function(event)
  {
    var app = getApp();
    var that = this;
    let aid = event.currentTarget.id;
    console.log(aid)
        wx.setStorageSync('aid', JSON.stringify(aid))
        wx.navigateTo({
          url: '/pages/unjoindetails/unjoindetails',
        })
        
},
  btns:function (event){
    var app = getApp();
    var that = this;
    let userInfo0=wx.getStorageSync('userInfo')
    if(userInfo0){
      this.setData({
        userInfo: JSON.parse(userInfo0)
      })
    }
    let aid = event.currentTarget.id;
    // let aname = event.currentTarget.dataset.id2;
    console.log(aid)
    // console.log(aname)
  var ul= "http://localhost:8080/link/sign?aid=" + aid + "&uid=" + that.data.userInfo.data.id;
  console.log(ul)
    wx.request({
      url: ul,
      data:{
      },
      method: "POST",
          header: {
            "content-type": "application/json",
            // "Authorization":app.globalData.token
          },
        
    success: function success(res) {
      console.log(res.data)
      if(res.data.code === 200){ // 登录成功
        wx.showToast({
          title: '报名成功'
        })
        wx.redirectTo({
          url: '/pages/more/more'
       })
        
}
}

    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    var app = getApp();
    var that = this;
    var getData
    let userInfo0=wx.getStorageSync('userInfo')
    if(userInfo0){
      this.setData({
        userInfo: JSON.parse(userInfo0)
      })
    }
    var ul = "http://localhost:8080/activities/unjoin/" + that.data.userInfo.data.id;
    console.log(ul)
    wx.request({
      url: ul,
      data:{
      },
      method: "GET",
          header: {
            "content-type": "application/json"
          },
        
    success: function success(res) {
      console.log(res.data)
      getData = res.data
      that.setData({
        goodsList:getData.data,
      })
}

    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },
  

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    //console.log('下拉了');
    //重置数组
    this.setData({
      goodsList:goodsListData,
    });
    //重置页码
    this.QueryParams.pagenum=1;
    //重新发送请求
    this.getGoodsList();
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    //console.log('页面触底了~~');
    //判断还有没有下一页数据
    if(this.QueryParams.pagenum>=this.totalPages){
      //没有下一页数据了
      wx.showToast({
        title: '没有更多数据了',
        icon:'none'
      });
        
    }else{
      this.QueryParams.pagenum++;
      this.getGoodsList();
    }

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})