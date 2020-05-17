<?php

use think\facade\Route;

Route::resource('car/brands', 'car/Brands');
Route::get('car/brands/subBrands', 'car/Brands/subBrands');
Route::resource('car/elements', 'car/Elements');
Route::resource('car/pages', 'car/Pages');
Route::resource('car/userElements', 'car/UserElements');

Route::get('car/search', 'car/Elements/search');
Route::get('car/elements/my', 'car/Elements/my');
Route::get('car/elements/relatedElements', 'car/Elements/relatedElements');
Route::post('car/elements/doLike', 'car/Elements/doLike');
Route::post('car/elements/cancelLike', 'car/Elements/cancelLike');
Route::post('car/elements/doFavorite', 'car/Elements/doFavorite');
Route::post('car/elements/cancelFavorite', 'car/Elements/cancelFavorite');
Route::get('car/tags/:id/elements', 'car/Tags/elements');
Route::get('car/tags', 'car/Tags/index');
Route::get('car/tags/hotTags', 'car/Tags/hotTags');

Route::post('car/userElements/deletes', 'car/UserElements/deletes');