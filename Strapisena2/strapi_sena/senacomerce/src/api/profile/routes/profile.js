'use strict';

/**
 * profile service.
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::profile.profile');