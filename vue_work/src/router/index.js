import Vue from 'vue'
import VueRouter from 'vue-router'
import Smart from '../pages/Smart.vue'
import Index from '../pages/Index.vue'
import SelectNews from '../pages/SelectNews.vue'

Vue.use(VueRouter)

const routes = [{
    path: '/',
    redirect: '/index'
},
{
    path: '/index',
    name: 'Index',
    component: Index,
    meta: { title: '网摊' },
    children: [
        {
            path: '/index',
            redirect: '/index/news'
        },
        {
            path: 'news',
            name: 'News',
            // route level code-splitting
            // this generates a separate chunk (about.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () =>
                import( /* webpackChunkName: "about" */ '../pages/News.vue'),
            meta: { title: '超级新品' }

        },
        {
            path: 'smart',
            name: 'Smart',
            component: Smart,
            meta: { title: '智能家居' }
        },
        {
            path:'selectNews',
            name:'selectNews',
            component:SelectNews,
            meta:{title:'查询新闻'}
        }
    ]
},
{
    path: '/join',
    name: 'Join',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
        import( /* webpackChunkName: "about" */ '../pages/Join.vue'),
    meta: { title: '网摊推荐' }

},

]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

// 全局后置路由守卫————初始化的时候被调用、每次路由切换之后被调用
router.afterEach((to) => {
    document.title = to.meta.title || '网摊'
})
export default router