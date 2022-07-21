const  getCSRF = () => {
  return {headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').last().attr('content')}};
}

export {getCSRF}