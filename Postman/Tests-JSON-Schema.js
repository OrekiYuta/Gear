// 01. get schema from https://www.liquid-technologies.com/online-json-to-schema-converter
var schema = {
    //   "$schema": "http://json-schema.org/draft-04/schema#",
      "type": "array",
      "items": [
        {
          "type": "object",
          "properties": {
            "word": {
              "type": "string"
            },
            "phonetics": {
              "type": "array",
              "items": [
                {
                  "type": "object",
                  "properties": {
                    "audio": {
                      "type": "string"
                    },
                    "sourceUrl": {
                      "type": "string"
                    },
                    "license": {
                      "type": "object",
                      "properties": {
                        "name": {
                          "type": "string"
                        },
                        "url": {
                          "type": "string"
                        }
                      },
                      "required": [
                        "name",
                        "url"
                      ]
                    }
                  },
                  "required": [
                    "audio",
                    "sourceUrl",
                    "license"
                  ]
                },
                {
                  "type": "object",
                  "properties": {
                    "text": {
                      "type": "string"
                    },
                    "audio": {
                      "type": "string"
                    },
                    "sourceUrl": {
                      "type": "string"
                    },
                    "license": {
                      "type": "object",
                      "properties": {
                        "name": {
                          "type": "string"
                        },
                        "url": {
                          "type": "string"
                        }
                      },
                      "required": [
                        "name",
                        "url"
                      ]
                    }
                  },
                  "required": [
                    "text",
                    "audio",
                    "sourceUrl",
                    "license"
                  ]
                },
                {
                  "type": "object",
                  "properties": {
                    "text": {
                      "type": "string"
                    },
                    "audio": {
                      "type": "string"
                    }
                  },
                  "required": [
                    "text",
                    "audio"
                  ]
                }
              ]
            },
            "meanings": {
              "type": "array",
              "items": [
                {
                  "type": "object",
                  "properties": {
                    "partOfSpeech": {
                      "type": "string"
                    },
                    "definitions": {
                      "type": "array",
                      "items": [
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms"
                          ]
                        }
                      ]
                    },
                    "synonyms": {
                      "type": "array",
                      "items": [
                        {
                          "type": "string"
                        }
                      ]
                    },
                    "antonyms": {
                      "type": "array",
                      "items": {}
                    }
                  },
                  "required": [
                    "partOfSpeech",
                    "definitions",
                    "synonyms",
                    "antonyms"
                  ]
                },
                {
                  "type": "object",
                  "properties": {
                    "partOfSpeech": {
                      "type": "string"
                    },
                    "definitions": {
                      "type": "array",
                      "items": [
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms"
                          ]
                        }
                      ]
                    },
                    "synonyms": {
                      "type": "array",
                      "items": {}
                    },
                    "antonyms": {
                      "type": "array",
                      "items": {}
                    }
                  },
                  "required": [
                    "partOfSpeech",
                    "definitions",
                    "synonyms",
                    "antonyms"
                  ]
                },
                {
                  "type": "object",
                  "properties": {
                    "partOfSpeech": {
                      "type": "string"
                    },
                    "definitions": {
                      "type": "array",
                      "items": [
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "example": {
                              "type": "string"
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms",
                            "example"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "example": {
                              "type": "string"
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms",
                            "example"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "example": {
                              "type": "string"
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms",
                            "example"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "example": {
                              "type": "string"
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms",
                            "example"
                          ]
                        },
                        {
                          "type": "object",
                          "properties": {
                            "definition": {
                              "type": "string"
                            },
                            "synonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "antonyms": {
                              "type": "array",
                              "items": {}
                            },
                            "example": {
                              "type": "string"
                            }
                          },
                          "required": [
                            "definition",
                            "synonyms",
                            "antonyms",
                            "example"
                          ]
                        }
                      ]
                    },
                    "synonyms": {
                      "type": "array",
                      "items": {}
                    },
                    "antonyms": {
                      "type": "array",
                      "items": [
                        {
                          "type": "string"
                        },
                        {
                          "type": "string"
                        }
                      ]
                    }
                  },
                  "required": [
                    "partOfSpeech",
                    "definitions",
                    "synonyms",
                    "antonyms"
                  ]
                }
              ]
            },
            "license": {
              "type": "object",
              "properties": {
                "name": {
                  "type": "string"
                },
                "url": {
                  "type": "string"
                }
              },
              "required": [
                "name",
                "url"
              ]
            },
            "sourceUrls": {
              "type": "array",
              "items": [
                {
                  "type": "string"
                }
              ]
            }
          },
          "required": [
            "word",
            "phonetics",
            "meanings",
            "license",
            "sourceUrls"
          ]
        }
      ]
    }
    
    // 02. test the response json schema
    const response = pm.response.json();
    
    pm.test('Schema is valid', () => {
        pm.expect(response).to.have.jsonSchema(schema);
    });
    
    
    
    
    // other way, using tv4 to do schema validate
    // var schema = {
    //     "items": {
    //         "type": "boolean"
    //     }
    // };
    
    // pm.test('Schema is valid', function () {
    //     var jsonData = pm.response.json();
    //     pm.expect(tv4.validate(jsonData, schema)).to.be.true;
    // });
    