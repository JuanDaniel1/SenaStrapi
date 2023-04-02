'use strict';

/**
 * producto-popular service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::producto-popular.producto-popular');
