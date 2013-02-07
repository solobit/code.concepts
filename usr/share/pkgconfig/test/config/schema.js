var schema = {
    properties: {
        port: {
            description: 'The web server port number.',
            type: 'integer',
            required: true,
            minimum: 1,
            maximum: 65535,
            default: 80
        }
    }
};

module.exports = schema;
