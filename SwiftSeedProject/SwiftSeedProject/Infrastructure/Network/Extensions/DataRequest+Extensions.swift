//
//  ApiProtocol.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 3/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension DataRequest: RestClientRequestProtocol {
    
    static func responseSerializer(errorSanitizer: @escaping (JSON) -> Result<JSON>) -> DataResponseSerializer<JSON> {
        return DataResponseSerializer<JSON> { request, response, data, error in
            if let error = error {
                return .failure(error)
            }
            
            guard let validData = data else {
                let reason = "Data could not be serialized. Input data was nil."
                return .failure(NSError(domain: InfoUtils.bundleNameKey(), code: ErrorCode.SerializationFailed, userInfo: [NSLocalizedDescriptionKey : reason]))
            }
            
            let json = JSON(data: validData)
            // TODO: Should consider HTTP response as well.
            return errorSanitizer(json)
        }
    }
    
    func getResponse(errorSanitizer: @escaping (JSON) -> Result<JSON>, completionHandler: @escaping (DataResponse<JSON>) -> Void) -> Self {
        self.validate { request, response, data in
            return .success
        }
        .response(responseSerializer: DataRequest.responseSerializer(errorSanitizer: errorSanitizer)) { response in
            completionHandler(response)
        }
        return self;
    }
    
}
