class MemberService
  ETHNICITY = {
    'Asian' => '0',
    'Indian' => '1',
    'African Americans' => '2',
    'Asian Americans' => '3',
    'European' => '4',
    'British' => '5',
    'Jewish' => '6',
    'Latino' => '7',
    'Native American' => '8',
    'Arabic' => '9'
  }

  BASE_URL = "http://idfy.0x10.info/api/idfy-status?type=json"
  MAX_PAGES = 200
  QUERY = { members: 'list_member', hits: 'api_hits'}

  def self.fetch_members(params = {})
    response = HTTParty.get(BASE_URL, query: { query: QUERY[:members], page: params[:page]})
    members_json = response.parsed_response['members']
    members = members_json.map { |member_json| MemberResponse.new(member_json) }
    members.select! { |member| member.ethnicity == params[:ethnicity] } if params[:ethnicity].in?(ETHNICITY.values)
    members
  end

  def self.api_hits
    response = HTTParty.get(BASE_URL, query: { query: QUERY[:hits] })
    response.parsed_response['api_hits']
  end
end