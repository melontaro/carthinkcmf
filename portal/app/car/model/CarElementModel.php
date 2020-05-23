<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2021 http://www.xamclub.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: TouchAfflatus <axuyin@163.com>
// +----------------------------------------------------------------------
namespace app\car\model;

use app\admin\model\RouteModel;
use think\Model;
use think\Db;

/**
 * @property mixed id
 */
class CarElementModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    /**
     * 关联 user表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('UserModel', 'user_id')->setEagerlyType(1);
    }

    /**
     * 关联品牌表
     * @return \think\model\relation\BelongsToMany
     */
    public function brands()
    {
        return $this->belongsToMany('CarBrandModel', 'car_brand_element', 'brand_id', 'element_id');
    }
    /**
     * 关联品牌表
     * @return \think\model\relation\BelongsToMany
     */
    public function areas()
    {
        return $this->belongsToMany('CarAreaModel', 'car_area_element', 'area_id', 'element_id');
    }
    /**
     * 关联标签表
     * @return \think\model\relation\BelongsToMany
     */
    public function tags()
    {
        return $this->belongsToMany('CarTagModel', 'car_tag_element', 'tag_id', 'element_id');
    }
    /**
     * 关联车龄表
     * @return \think\model\relation\BelongsToMany
     */
    public function ages()
    {
        return $this->belongsToMany('CarAgeRangeModel', 'car_age_range_element', 'age_range_id', 'element_id');
    }
    /**
     * 关联颜色表
     * @return \think\model\relation\BelongsToMany
     */
    public function colors()
    {
        return $this->belongsToMany('CarColorModel', 'car_color_element', 'color_id', 'element_id');
    }
    /**
     * 关联国籍表
     * @return \think\model\relation\BelongsToMany
     */
    public function countrys()
    {
        return $this->belongsToMany('CarCountryModel', 'car_country_element', 'country_id', 'element_id');
    }
    /**
     * 关联排量范围表
     * @return \think\model\relation\BelongsToMany
     */
    public function displacementRanges()
    {
        return $this->belongsToMany('CarDisplacementRangeModel', 'car_displacement_range_element', 'displacement_range_id', 'element_id');
    }
    /**
     * 关联排放标准表
     * @return \think\model\relation\BelongsToMany
     */
    public function emissionStandards()
    {
        return $this->belongsToMany('CarEmissionStandardModel', 'car_emission_standard_element', 'emission_standard_id', 'element_id');
    }
    /**
     * 关联能源表
     * @return \think\model\relation\BelongsToMany
     */
    public function energys()
    {
        return $this->belongsToMany('CarEnergyModel', 'car_energy_element', 'energy_id', 'element_id');
    }
    /**
     * 关联发动机表
     * @return \think\model\relation\BelongsToMany
     */
    public function engines()
    {
        return $this->belongsToMany('CarEngineModel', 'car_engine_element', 'engine_id', 'element_id');
    }

    /**
     * 关联变速箱表
     * @return \think\model\relation\BelongsToMany
     */
    public function gearboxs()
    {
        return $this->belongsToMany('CarGearboxModel', 'car_gearbox_element', 'gearbox_id', 'element_id');
    }
    /**
     * 关联车级别表
     * @return \think\model\relation\BelongsToMany
     */
    public function levels()
    {
        return $this->belongsToMany('CarLevelModel', 'car_level_element', 'level_id', 'element_id');
    }
    /**
 * 关联车亮点
 * @return \think\model\relation\BelongsToMany
 */
    public function lightspots()
    {
        return $this->belongsToMany('CarLightspotModel', 'car_lightspot_element', 'lightspot_id', 'element_id');
    }
    /**
     * 关联车里程
     * @return \think\model\relation\BelongsToMany
     */
    public function mileages()
    {
        return $this->belongsToMany('CarMileageModel', 'car_mileage_element', 'mileage_id', 'element_id');
    }
    /**
     * 关联价格范围
     * @return \think\model\relation\BelongsToMany
     */
    public function priceRanges()
    {
        return $this->belongsToMany('CarPriceRangeModel', 'car_price_range_element', 'price_range_id', 'element_id');
    }
    /**
     * 关联生产方式
     * @return \think\model\relation\BelongsToMany
     */
    public function productionTypes()
    {
        return $this->belongsToMany('CarProductionTypeModel', 'car_production_type_element', 'production_type_id', 'element_id');
    }
    /**
     * 关联座位数
     * @return \think\model\relation\BelongsToMany
     */
    public function seats()
    {
        return $this->belongsToMany('CarSeatModel', 'car_seat_element', 'seat_id', 'element_id');
    }
    /**
     * element_content 自动转化
     * @param $value
     * @return string
     */
    public function getElementContentAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    /**
     * element_content 自动转化
     * @param $value
     * @return string
     */
    public function setElementContentAttr($value)
    {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }

    /**
     * published_time 自动完成
     * @param $value
     * @return false|int
     */
    public function setPublishedTimeAttr($value)
    {
        return strtotime($value);
    }

    /**
     * 后台管理添加车
     * @param array        $data       车数据
     * @param array|string $brands 车品牌 id
     * @return $this
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function adminAddElement($data, $brands)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            $data['thumbnail']         = $data['more']['thumbnail'];
        }

        if (!empty($data['more']['audio'])) {
            $data['more']['audio'] = cmf_asset_relative_url($data['more']['audio']);
        }

        if (!empty($data['more']['video'])) {
            $data['more']['video'] = cmf_asset_relative_url($data['more']['video']);
        }

        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        if (is_string($brands)) {
            $brands = explode(',', $brands);
        }
        $lightspots=$data['lightspots'];
        if (is_string($lightspots)) {
            $lightspots = explode(',', $lightspots);//将字符串打散为数组
        }

        $areas= $data['areas'];
        if (is_string($areas)) {
            $areas = explode(',', $areas);//将字符串打散为数组
        }
        $this->brands()->save($brands);
       // $this->ages()->save($data['ages']);
        $this->colors()->save($data['colors']);
        $this->countrys()->save($data['countrys']);
        $this->displacementRanges()->save($data['displacementRanges']);
        $this->emissionStandards()->save($data['emissionStandards']);
        $this->energys()->save($data['energys']);
        $this->engines()->save($data['engines']);
        $this->gearboxs()->save($data['gearboxs']);
        $this->levels()->save($data['levels']);
        $this->lightspots()->save($lightspots);
        $this->mileages()->save($data['mileages']);
        //$this->priceRanges()->save($data['priceRanges']);
        $this->productionTypes()->save($data['productionTypes']);
        $this->seats()->save($data['seats']);
        $this->areas()->save($areas);



        $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);

        $keywords = explode(',', $data['element_keywords']);

        $this->addTags($keywords, $this->id);

        return $this;

    }

    /**
     * 后台管理编辑车
     * @param array        $data       车数据
     * @param array|string $brands 车品牌 id
     * @return $this
     * @throws \think\Exception
     */
    public function adminEditElement($data, $brands)
    {

        unset($data['user_id']);

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            $data['thumbnail']         = $data['more']['thumbnail'];
        }

        if (!empty($data['more']['audio'])) {
            $data['more']['audio'] = cmf_asset_relative_url($data['more']['audio']);
        }

        if (!empty($data['more']['video'])) {
            $data['more']['video'] = cmf_asset_relative_url($data['more']['video']);
        }

        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        if (is_string($brands)) {
            $brands = explode(',', $brands);
        }

        $oldBrandIds        = $this->brands()->column('brand_id');
        $sameBrandIds       = array_intersect($brands, $oldBrandIds);
        $needDeleteBrandIds = array_diff($oldBrandIds, $sameBrandIds);
        $newBrandIds        = array_diff($brands, $sameBrandIds);

        if (!empty($needDeleteBrandIds)) {
            $this->brands()->detach($needDeleteBrandIds);
        }

        if (!empty($newBrandIds)) {
            $this->brands()->attach(array_values($newBrandIds));
        }
        /*
        //车龄
        $ages=$data['ages'];
        if (is_string($ages)) {
            $ages = explode(',', $ages);
        }

        $oldAgeIds        = $this->ages()->column('age_id');
        $sameAgeIds       = array_intersect($ages, $oldAgeIds);
        $needDeleteAgeIds = array_diff($oldAgeIds, $sameAgeIds);
        $newAgeIds        = array_diff($ages, $sameAgeIds);

        if (!empty($needDeleteAgeIds)) {
            $this->ages()->detach($needDeleteAgeIds);
        }

        if (!empty($newAgeIds)) {
            $this->ages()->attach(array_values($newAgeIds));
        }
        */
        //车颜色
        $colors=$data['colors'];
        if (is_string($colors)) {
            $colors = explode(',', $colors);
        }

        $oldColorIds        = $this->colors()->column('color_id');
        $sameColorIds       = array_intersect($colors, $oldColorIds);
        $needDeleteColorIds = array_diff($oldColorIds, $sameColorIds);
        $newColorIds        = array_diff($colors, $sameColorIds);

        if (!empty($needDeleteColorIds)) {
            $this->colors()->detach($needDeleteColorIds);
        }

        if (!empty($newColorIds)) {
            $this->colors()->attach(array_values($newColorIds));
        }
        //车国籍
        $countrys=$data['countrys'];
        if (is_string($countrys)) {
            $countrys = explode(',', $countrys);
        }

        $oldCountryIds        = $this->countrys()->column('country_id');
        $sameCountryIds       = array_intersect($countrys, $oldCountryIds);
        $needDeleteCountryIds = array_diff($oldCountryIds, $sameCountryIds);
        $newCountryIds        = array_diff($countrys, $sameCountryIds);

        if (!empty($needDeleteCountryIds)) {
            $this->countrys()->detach($needDeleteCountryIds);
        }

        if (!empty($newCountryIds)) {
            $this->countrys()->attach(array_values($newCountryIds));
        }
        //车排量

         $displacementRanges=$data['displacementRanges'];
        if (is_string($displacementRanges)) {
            $displacementRanges = explode(',', $displacementRanges);
        }

        $oldDisplacementRangeIds        = $this->displacementRanges()->column('displacement_range_id');
        $sameDisplacementRangeIds       = array_intersect($displacementRanges, $oldDisplacementRangeIds);
        $needDeleteDisplacementRangeIds = array_diff($oldBrandIds, $sameDisplacementRangeIds);
        $newDisplacementRangeIds        = array_diff($displacementRanges, $sameDisplacementRangeIds);

        if (!empty($needDeleteDisplacementRangeIds)) {
            $this->displacementRanges()->detach($needDeleteDisplacementRangeIds);
        }

        if (!empty($newDisplacementRangeIds)) {
            $this->displacementRanges()->attach(array_values($newDisplacementRangeIds));
        }
        //排放标准
        $emissionStandards=$data['emissionStandards'];
        if (is_string($emissionStandards)) {
            $emissionStandards = explode(',', $emissionStandards);
        }

        $oldEmissionStandardIds        = $this->emissionStandards()->column('emission_standard_id');
        $sameEmissionStandardIds       = array_intersect($emissionStandards, $oldEmissionStandardIds);
        $needDeleteEmissionStandardIds = array_diff($oldEmissionStandardIds, $sameEmissionStandardIds);
        $newEmissionStandardIds        = array_diff($emissionStandards, $sameEmissionStandardIds);

        if (!empty($needDeleteEmissionStandardIds)) {
            $this->emissionStandards()->detach($needDeleteEmissionStandardIds);
        }

        if (!empty($newEmissionStandardIds)) {
            $this->emissionStandards()->attach(array_values($newEmissionStandardIds));
        }

        //车能源
        $energys=$data['energys'];
        if (is_string($energys)) {
            $energys = explode(',', $energys);
        }

        $oldEnergyIds        = $this->energys()->column('energy_id');
        $sameEnergyIds       = array_intersect($energys, $oldEnergyIds);
        $needDeleteEnergyIds = array_diff($oldEnergyIds, $sameEnergyIds);
        $newEnergyIds        = array_diff($energys, $sameEnergyIds);

        if (!empty($needDeleteEnergyIds)) {
            $this->energys()->detach($needDeleteEnergyIds);
        }

        if (!empty($newEnergyIds)) {
            $this->energys()->attach(array_values($newEnergyIds));
        }

        //车发动机
        $engines=$data['engines'];
        if (is_string($engines)) {
            $engines = explode(',', $engines);
        }

        $oldEngineIds        = $this->engines()->column('engine_id');
        $sameEngineIds       = array_intersect($engines, $oldEngineIds);
        $needDeleteEngineIds = array_diff($oldEngineIds, $sameEngineIds);
        $newEngineIds        = array_diff($engines, $sameEngineIds);

        if (!empty($needDeleteEngineIds)) {
            $this->engines()->detach($needDeleteEngineIds);
        }

        if (!empty($newEngineIds)) {
            $this->engines()->attach(array_values($newEngineIds));
        }

        //车变速箱
        $gearboxs=$data['gearboxs'];
        if (is_string($gearboxs)) {
            $gearboxs = explode(',', $gearboxs);
        }

        $oldGearboxIds        = $this->gearboxs()->column('gearbox_id');
        $sameGearboxIds       = array_intersect($gearboxs, $oldGearboxIds);
        $needDeleteGearboxIds = array_diff($oldGearboxIds, $sameGearboxIds);
        $newGearboxIds        = array_diff($gearboxs, $sameGearboxIds);

        if (!empty($needDeleteGearboxIds)) {
            $this->gearboxs()->detach($needDeleteGearboxIds);
        }

        if (!empty($newGearboxIds)) {
            $this->gearboxs()->attach(array_values($newGearboxIds));
        }


        //车级别
        $levels=$data['levels'];

        if (is_string($levels)) {
            $levels = explode(',', $levels);
        }

        $oldLevelIds        = $this->levels()->column('level_id');
        $sameLevelIds       = array_intersect($levels, $oldLevelIds);
        $needDeleteLevelIds = array_diff($oldLevelIds, $sameLevelIds);
        $newLevelIds        = array_diff($levels, $sameLevelIds);

        if (!empty($needDeleteLevelIds)) {
            $this->levels()->detach($needDeleteLevelIds);
        }

        if (!empty($newLevelIds)) {
            $this->levels()->attach(array_values($newLevelIds));
        }


        //车亮点
        $lightspots=$data['lightspots'];
        if (is_string($lightspots)) {
            $lightspots = explode(',', $lightspots);
        }

        $oldLightspotIds        = $this->lightspots()->column('lightspot_id');
        $sameLightspotIds       = array_intersect($lightspots, $oldLightspotIds);
        $needDeleteLightspotIds = array_diff($oldLightspotIds, $sameLightspotIds);
        $newLightspotIds        = array_diff($lightspots, $sameLightspotIds);

        if (!empty($needDeleteLightspotIds)) {
            $this->lightspots()->detach($needDeleteLightspotIds);
        }

        if (!empty($newLightspotIds)) {
            $this->lightspots()->attach(array_values($newLightspotIds));
        }


        //车里程
        $mileages=$data['mileages'];

        if (is_string($mileages)) {
            $mileages = explode(',', $mileages);
        }

        $oldMileageIds        = $this->mileages()->column('mileage_id');
        $sameMileageIds       = array_intersect($mileages, $oldMileageIds);
        $needDeleteMileageIds = array_diff($oldMileageIds, $sameMileageIds);
        $newMileageIds        = array_diff($mileages, $sameMileageIds);

        if (!empty($needDeleteMileageIds)) {
            $this->mileages()->detach($needDeleteMileageIds);
        }

        if (!empty($newMileageIds)) {
            $this->mileages()->attach(array_values($newMileageIds));
        }
/*
        //车价格范围

        $priceRanges=$data['priceRanges'];

        if (is_string($priceRanges)) {
            $priceRanges = explode(',', $priceRanges);
        }

        $oldPriceRangeIds        = $this->priceRanges()->column('price_range_id');
        $samePriceRangeIds       = array_intersect($priceRanges, $oldPriceRangeIds);
        $needDeletePriceRangeIds = array_diff($oldPriceRangeIds, $samePriceRangeIds);
        $newPriceRangeIds        = array_diff($priceRanges, $samePriceRangeIds);

        if (!empty($needDeletePriceRangeIds)) {
            $this->priceRanges()->detach($needDeletePriceRangeIds);
        }

        if (!empty($newPriceRangeIds)) {
            $this->priceRanges()->attach(array_values($newPriceRangeIds));
        }
*/
        //车生产方式
        $productionTypes=$data['productionTypes'];
        if (is_string($productionTypes)) {
            $productionTypes = explode(',', $productionTypes);
        }

        $oldProductionTypeIds        = $this->productionTypes()->column('production_type_id');
        $sameProductionTypeIds       = array_intersect($productionTypes, $oldProductionTypeIds);
        $needDeleteProductionTypeIds = array_diff($oldProductionTypeIds, $sameProductionTypeIds);
        $newProductionTypeIds        = array_diff($productionTypes, $sameProductionTypeIds);

        if (!empty($needDeleteProductionTypeIds)) {
            $this->productionTypes()->detach($needDeleteProductionTypeIds);
        }

        if (!empty($newProductionTypeIds)) {
            $this->productionTypes()->attach(array_values($newProductionTypeIds));
        }

        //车座位数
        $seats=$data['seats'];
        if (is_string($seats)) {
            $seats = explode(',', $seats);
        }

        $oldSeatIds        = $this->seats()->column('seat_id');
        $sameSeatIds       = array_intersect($seats, $oldSeatIds);
        $needDeleteSeatIds = array_diff($oldSeatIds, $sameSeatIds);
        $newSeatIds        = array_diff($seats, $sameSeatIds);

        if (!empty($needDeleteSeatIds)) {
            $this->seats()->detach($needDeleteSeatIds);
        }

        if (!empty($newSeatIds)) {
            $this->seats()->attach(array_values($newSeatIds));
        }


        //地区
        $areas=$data['areas'];
        if (is_string($areas)) {
            $areas = explode(',', $areas);
        }

        $oldAreaIds        = $this->areas()->column('area_id');
        $sameAreaIds       = array_intersect($areas, $oldAreaIds);
        $needDeleteAreaIds = array_diff($oldAreaIds, $sameAreaIds);
        $newAreaIds        = array_diff($areas, $sameAreaIds);

        if (!empty($needDeleteAreaIds)) {
            $this->areas()->detach($needDeleteAreaIds);
        }

        if (!empty($newAreaIds)) {
            $this->areas()->attach(array_values($newAreaIds));
        }



        $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);

        $keywords = explode(',', $data['element_keywords']);

        $this->addTags($keywords, $data['id']);

        return $this;

    }

    /**
     * 增加标签
     * @param $keywords
     * @param $elementId
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function addTags($keywords, $elementId)
    {
        $carTagModel = new CarTagModel();

        $tagIds = [];

        $data = [];

        if (!empty($keywords)) {

            $oldTagIds = Db::name('car_tag_element')->where('element_id', $elementId)->column('tag_id');

            foreach ($keywords as $keyword) {
                $keyword = trim($keyword);
                if (!empty($keyword)) {
                    $findTag = $carTagModel->where('name', $keyword)->find();
                    if (empty($findTag)) {
                        $tagId = $carTagModel->insertGetId([
                            'name' => $keyword
                        ]);
                    } else {
                        $tagId = $findTag['id'];
                    }

                    if (!in_array($tagId, $oldTagIds)) {
                        array_push($data, ['tag_id' => $tagId, 'element_id' => $elementId]);
                    }

                    array_push($tagIds, $tagId);

                }
            }


            if (empty($tagIds) && !empty($oldTagIds)) {
                Db::name('car_tag_element')->where('element_id', $elementId)->delete();
            }

            $sameTagIds = array_intersect($oldTagIds, $tagIds);

            $shouldDeleteTagIds = array_diff($oldTagIds, $sameTagIds);

            if (!empty($shouldDeleteTagIds)) {
                Db::name('car_tag_element')
                    ->where('element_id', $elementId)
                    ->where('tag_id', 'in', $shouldDeleteTagIds)
                    ->delete();
            }

            if (!empty($data)) {
                Db::name('car_tag_element')->insertAll($data);
            }


        } else {
            Db::name('car_tag_element')->where('element_id', $elementId)->delete();
        }
    }

    /**
     * @param $data
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminDeletePage($data)
    {

        if (isset($data['id'])) {
            $id = $data['id']; //获取删除id

            $res = $this->where('id', $id)->find();

            if ($res) {
                $res = json_decode(json_encode($res), true); //转换为数组

                $recycleData = [
                    'object_id'   => $res['id'],
                    'create_time' => time(),
                    'table_name'  => 'car_element#page',
                    'name'        => $res['element_title'],

                ];

                Db::startTrans(); //开启事务
                $transStatus = false;
                try {
                    Db::name('car_element')->where('id', $id)->update([
                        'delete_time' => time()
                    ]);
                    Db::name('recycle_bin')->insert($recycleData);

                    $transStatus = true;
                    // 提交事务
                    Db::commit();
                } catch (\Exception $e) {

                    // 回滚事务
                    Db::rollback();
                }
                return $transStatus;


            } else {
                return false;
            }
        } elseif (isset($data['ids'])) {
            $ids = $data['ids'];

            $res = $this->where('id', 'in', $ids)
                ->select();

            if ($res) {
                $res = json_decode(json_encode($res), true);
                foreach ($res as $key => $value) {
                    $recycleData[$key]['object_id']   = $value['id'];
                    $recycleData[$key]['create_time'] = time();
                    $recycleData[$key]['table_name']  = 'car_element';
                    $recycleData[$key]['name']        = $value['element_title'];

                }

                Db::startTrans(); //开启事务
                $transStatus = false;
                try {
                    Db::name('car_element')->where('id', 'in', $ids)
                        ->update([
                            'delete_time' => time()
                        ]);


                    Db::name('recycle_bin')->insertAll($recycleData);

                    $transStatus = true;
                    // 提交事务
                    Db::commit();

                } catch (\Exception $e) {

                    // 回滚事务
                    Db::rollback();


                }
                return $transStatus;


            } else {
                return false;
            }

        } else {
            return false;
        }
    }

    /**
     * 后台管理添加页面
     * @param array $data 页面数据
     * @return $this
     */
    public function adminAddPage($data)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $data['element_status'] = empty($data['element_status']) ? 0 : 1;
        $data['element_type']   = 2;
        $this->allowField(true)->data($data, true)->save();

        return $this;

    }

    /**
     * 后台管理编辑页面
     * @param array $data 页面数据
     * @return $this
     */
    public function adminEditPage($data)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $data['element_status'] = empty($data['element_status']) ? 0 : 1;
        $data['element_type']   = 2;
        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        $routeModel = new RouteModel();
        $routeModel->setRoute($data['element_alias'], 'car/Page/index', ['id' => $data['id']], 2, 5000);

        $routeModel->getRoutes(true);
        return $this;
    }

}
