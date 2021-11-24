import { generateAsyncAction } from '@/store/generateAsync';
import * as auth from '@/store/api/auth';
import * as api from '@/store/api/user';
import * as types from './mutationTypes';

export default {
    getProfile: generateAsyncAction(auth.getProfile, { mutateType: types.LOAD_USERINFO }),
    getUserEnrolled: generateAsyncAction(api.getUserEnrolled, { mutateType: types.LOAD_USERENROLLED }),
    getUserPublished: generateAsyncAction(api.getUserPublished, { mutateType: types.LOAD_USERPUBLISHED}),
    getUserCollections:function(){return function(data){console.log(data)}}//临时解决报错问题
};
